<?php

namespace CertificaDev\Http\Requests\Auth;

use CertificaDev\Http\Requests\Request;

class RegisterRequest extends Request {

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
            'rutfull'=> 'required|cl_rut',
            'rut' => 'required|unique:usuario,rut|integer|max:99999999',
            'dv' => 'required|max:1',
            'nombre' => 'required|max:32',
            'apaterno' => 'required|max:32',
            'amaterno' => 'required|max:32',
            'password' => 'required|confirmed|max:50|min:4'        
        ];
    }

    public function messages() {
        return [
            'rutfull.required' => 'El rut no se ha enviado de forma correcta, habilite Javascript'
        ];
    }

}
