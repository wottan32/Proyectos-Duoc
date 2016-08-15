<?php

namespace CertificaDev\Http\Controllers\Postulacion;

use CertificaDev\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;
use Illuminate\Http\Request;
use CertificaDev\Postulacion;
use CertificaDev\Comuna;
use CertificaDev\Modalidad;
use CertificaDev\Curso;
use CertificaDev\Http\Requests\Postulacion\CreateRequest;
use CertificaDev\Http\Requests\Postulacion\EditRequest;
use CertificaDev\Educacion;
use Illuminate\Support\Facades\Auth;
use Freshwork\ChileanBundle\Rut;
use Carbon\Carbon;

define('ALLOWED_CHARS', '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ');

class PostulacionController extends Controller {

    use AuthenticatesAndRegistersUsers,
        ThrottlesLogins;

    public function __construct() {
        $this->middleware('CertificaDev\\Http\Middleware\\Authenticate');
        $this->middleware('CertificaDev\\Http\Middleware\\RolMiddleware:ejecutivo', ['except' => ['getCreate', 'postCreate', 'getCheck', 'postCheck']]);
    }

    public function getList() {
        $postulaciones = Postulacion::get();
        return view('postulacion.list', ['postulaciones' => $postulaciones]);
    }

    public function getCreate() {
        $comunas = Comuna::orderBy('nombre', 'asc')->get();
        $modalidades = Modalidad::get();
        $cursos = Curso::get();
        $educaciones = Educacion::get();

        return view('postulacion.create', ['comunas' => $comunas, 'modalidades' => $modalidades, 'cursos' => $cursos, 'educaciones' => $educaciones]);
    }

    public function postCreate(CreateRequest $r) {
        $data = $r->only(['rutfull', 'nombre', 'apaterno', 'amaterno', 'fecha_nacimiento', 'sexo', 'telefono', 'email', 'direccion', 'comuna', 'educacion', 'experiencia', 'modalidad', 'curso']);
        $check_url = $this->getShortenedURLFromID(Postulacion::max('id') + 1);
        $data += ['check_url' => $check_url];
        $this->create($data);
        flash()->success('Postulaci&oacute;n realizada de forma existosa.');
        return view('postulacion.after_create', ['codigo' => $check_url,]);
    }

    public function getDelete() {
        return redirect('postulacion/list');
    }

    public function postDelete(Request $r) {
        $this->validate($r, [
            'idPostulacion' => 'required|integer',
        ]);
        Postulacion::destroy($r->input('idPostulacion'));
        flash()->success('Postulacion eliminada exitosamente');
        // return redirect('postulacion/list');
        return back();
    }

    public function getSearch(Request $r) {
        $tipo_busqueda = $r->tipo_busqueda;
        if (!empty($tipo_busqueda)) {
            switch ($tipo_busqueda) {
                case "por_rut":
                    $this->validate($r, [
                        'rutfull' => 'required|cl_rut',
                        'rut' => 'required|integer|max:99999999',
                        'dv' => 'required|max:1'], [
                        'rutfull.required' => 'El rut no se ha enviado de forma correcta, habilite Javascript']
                    );
                    $postulaciones = Postulacion::where('rut', Rut::parse($r->input('rutfull'))->number())->get();
                    if (count($postulaciones) > 0) {
                        //flash()->success('B&uacute;squeda exitosa');
                        return view('postulacion.list', ['postulaciones' => $postulaciones]);
                    } else {
                        return view('postulacion.search')->withErrors("No hay resultados para este rut");
                    }
                case "por_fecha":
                    $this->validate($r, [
                        'fecha_inicio' => 'required|date',
                        'fecha_termino' => 'required|date'], [
                    ]);
                    $to = Carbon::parse($r->input('fecha_termino'))->addDays(1)->subSeconds(1)->toDateTimeString();
                    $postulaciones = Postulacion::
                            whereBetween('created_at', array($r->input('fecha_inicio'), $to))
                            ->get();

                    if (count($postulaciones) > 0) {
                        //   flash()->success('B&uacute;squeda exitosa');
                        return view('postulacion.list', ['postulaciones' => $postulaciones]);
                    } else {
                        return back()->withErrors('No se encontraron resultados en el rango de fecha especificado');
                    }

                default:
                    break;
            }
        }

        return view('postulacion.search');
    }

    public function postSearch(Request $r) {
        return view('postulacion.search');
    }

    public function getEdit(Request $r) {
        $postulacion = Postulacion::find($r->id);
        if (count($postulacion) > 0) {
            $dv = Rut::set($postulacion->rut)->calculateVerificationNumber();
            $comunas = Comuna::orderBy('nombre', 'asc')->get();
            $modalidades = Modalidad::get();
            $cursos = Curso::get();
            $educaciones = Educacion::get();
            return view('postulacion.edit', [
                'comunas' => $comunas,
                'modalidades' => $modalidades,
                'cursos' => $cursos,
                'educaciones' => $educaciones,
                'postulacion' => $postulacion,
                'dv' => $dv
                    ]
            );
        } else {
            return redirect('postulacion/list')->withErrors('No se ha encontrado esa postulaci&oacute;n');
        }
    }

    public function getView(Request $r) {
        $postulacion = Postulacion::find($r->id);
        if (count($postulacion) > 0) {
            $dv = Rut::set($postulacion->rut)->calculateVerificationNumber();

            return view('postulacion.view', [
                'postulacion' => $postulacion,
                'dv' => $dv
                    ]
            );
        } else {
            return redirect('postulacion/list')->withErrors('No se ha encontrado esa postulaci&oacute;n');
        }
    }

    public function postEdit(EditRequest $r) {
        $this->update($r->only([ 'id', 'rutfull', 'nombre', 'apaterno', 'amaterno', 'fecha_nacimiento', 'sexo', 'telefono', 'email', 'direccion', 'comuna', 'educacion', 'experiencia', 'modalidad', 'curso', 'estado']));
        flash()->success('Postulacion modificada');
        //   return redirect('postulacion/list');
        return back();
    }

    public function getCheck(Request $r) {
        if ($r->codigo != null) {
            $postulacion = Postulacion::where('check_url', $r->codigo)->first();
            if ($postulacion != null) {
                $estado = $postulacion->estado()->first();
                return view('postulacion.check', ['estado' => $estado]);
            }
            return view('postulacion.check')->withErrors('No se ha encontrado la postulaci&oacute;n solicitada');
        }


        return view('postulacion.check');
    }

    protected function create(array $data) {
        return Postulacion::create([
                    'id' => Postulacion::max('id') + 1,
                    'rut' => !Auth::user()->isEjecutivo()?Auth::user()->rut: Rut::parse($data['rutfull'])->number(),
                    'nombre' => !Auth::user()->isEjecutivo()?Auth::user()->nombre: $data['nombre'],
                    'apaterno' => !Auth::user()->isEjecutivo()?Auth::user()->apaterno:$data['apaterno'],
                    'amaterno' => !Auth::user()->isEjecutivo()?Auth::user()->amaterno:$data['amaterno'],
                    'fecha_nacimiento' => $data['fecha_nacimiento'],
                    'sexo' => $data['sexo'],
                    'telefono' => $data['telefono'],
                    'email' => $data['email'],
                    'direccion' => $data['direccion'],
                    'check_url' => $data['check_url'],
                    'comuna_id' => $data['comuna'],
                    'educacion_id' => $data['educacion'],
                    'experiencia' => $data['experiencia'],
                    'modalidad_id' => $data['modalidad'],
                    'curso_id' => $data['curso'],
                    'estado_id' => 1,
                    'usuario_id' => Auth::user()->id
        ]);
    }

    protected function update(array $data) {
        $postulacion = Postulacion::find($data['id']);
        $postulacion->rut = Rut::parse($data['rutfull'])->number();
        $postulacion->nombre = $data['nombre'];
        $postulacion->apaterno = $data['apaterno'];
        $postulacion->amaterno = $data['amaterno'];
        $postulacion->fecha_nacimiento = $data['fecha_nacimiento'];
        $postulacion->sexo = $data['sexo'];
        $postulacion->telefono = $data['telefono'];
        $postulacion->email = $data['email'];
        $postulacion->direccion = $data['direccion'];
        $postulacion->comuna_id = $data['comuna'];
        $postulacion->educacion_id = $data['educacion'];
        $postulacion->experiencia = $data['experiencia'];
        $postulacion->modalidad_id = $data['modalidad'];
        $postulacion->curso_id = $data['curso'];
        $postulacion->estado_id = $data['estado'];
        $postulacion->save();
    }

    function getShortenedURLFromID($integer, $base = ALLOWED_CHARS) {
        $integer+=65536;
        $length = strlen($base);
        $base = str_split($base);
        $out = '';
        while ($integer > $length - 1) {
            $out = $base[fmod($integer, $length)] . $out;
            $integer = floor($integer / $length);
        }
        return $base[$integer] . $out;
    }

}
