<?php

namespace CertificaDev\Http\Controllers;

use CertificaDev\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;
use Illuminate\Http\Request;
use CertificaDev\User;

class IndexController extends Controller {

    use AuthenticatesAndRegistersUsers,
        ThrottlesLogins;

    public function __construct() {
        $this->middleware('CertificaDev\\Http\Middleware\\Authenticate');
    }

    public function getIndex() {

        return view('index');
    }

}
