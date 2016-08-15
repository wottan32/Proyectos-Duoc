<?php

namespace CertificaDev\Http\Requests\Postulacion;

use CertificaDev\Http\Requests\Request;

class EditRequest extends Request {

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize() {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules() {
        return [
            'id' => 'required|exists:postulacion,id',
            'rutfull' => 'required|cl_rut',
            'rut' => 'required|integer|max:99999999',
            'dv' => 'required|max:1',
            'nombre' => 'required|max:32',
            'apaterno' => 'required|max:32',
            'amaterno' => 'required|max:32',
            'fecha_nacimiento' => 'required|date',
            'sexo' => 'required|boolean',
            'telefono' => 'required|integer|max:99999999999',
            'email' => 'required|email|max:32',
            'direccion' => 'required|max:32',
            'comuna' => 'required|exists:comuna,id',
            'educacion' => 'required|exists:educacion,id',
            'experiencia' => 'required|integer|max:99999999999',
            'modalidad' => 'required|exists:modalidad,id',
            'curso' => 'required|exists:curso,id',
            'estado' => 'required|exists:estado,id'
        ];
    }

    public function messages() {
        return [
            'rutfull.required' => 'El rut no se ha enviado de forma correcta, habilite Javascript'
        ];
    }

}
