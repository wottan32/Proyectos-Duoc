<?php

namespace CertificaDev;

use Illuminate\Database\Eloquent\Model;

class Postulacion extends Model {

    protected $table = 'postulacion';
    protected $fillable = [
        'id', 'rut', 'nombre', 'apaterno', 'amaterno', 'fecha_nacimiento', 'sexo', 'telefono', 'email', 'direccion', 'check_url', 'estado_id', 'comuna_id', 'educacion_id', 'experiencia', 'modalidad_id', 'curso_id', 'usuario_id'
    ];

    public function user() {
        return $this->belongsTo('CertificaDev\\User');
    }

    public function modalidad() {
        return $this->belongsTo('CertificaDev\\Modalidad');
    }

    public function educacion() {
        return $this->belongsTo('CertificaDev\\Educacion');
    }

    public function curso() {
        return $this->belongsTo('CertificaDev\\Curso');
    }

    public function comuna() {
        return $this->belongsTo('CertificaDev\\Comuna');
    }

    public function estado() {
        return $this->belongsTo('CertificaDev\\Estado');
    }

}
