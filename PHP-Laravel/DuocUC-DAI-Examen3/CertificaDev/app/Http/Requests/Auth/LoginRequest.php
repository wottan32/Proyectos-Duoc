<?php

namespace CertificaDev\Http\Requests\Auth;

use CertificaDev\Http\Requests\Request;

class LoginRequest extends Request {

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
            'rutfull' => 'required|cl_rut',
            'rut' => 'required|integer|max:99999999',
            'dv' => 'required|max:1',
            'password' => 'required'
        ];
    }

    public function messages() {
        return [
            'rutfull.required' => 'El rut no se ha enviado de forma correcta, habilite Javascript'
        ];
    }

}
