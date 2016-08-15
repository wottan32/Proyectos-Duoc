<?php

namespace CertificaDev\Http\Controllers\Auth;

use CertificaDev\User;
use Validator;
use CertificaDev\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;
use CertificaDev\Http\Requests\Auth\LoginRequest;
use CertificaDev\Http\Requests\Auth\RegisterRequest;
use Freshwork\ChileanBundle\Laravel\Facades\Rut;

class AuthController extends Controller {
    /*
      |--------------------------------------------------------------------------
      | Registration & Login Controller
      |--------------------------------------------------------------------------
      |
      | This controller handles the registration of new users, as well as the
      | authentication of existing users. By default, this controller uses
      | a simple trait to add these behaviors. Why don't you explore it?
      |
     */

use AuthenticatesAndRegistersUsers,
    ThrottlesLogins;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new authentication controller instance.
     *
     * @return void
     */
    public function __construct() {
        $this->middleware($this->guestMiddleware(), ['except' => 'getLogout']);

        // $this->middleware('\\CertificaDev\\Http\Middleware\\Guest', ['except' => 'getLogout']);
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data) {
        return Validator::make($data, [
                    'name' => 'required|max:255',
                    'email' => 'required|email|max:255|unique:users',
                    'password' => 'required|min:6|confirmed',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return User
     */
    protected function create(array $data) {
        return User::create([
                    'id' => User::max('id') + 1,          
                    'rut' => Rut::parse($data['rutfull'])->number(),
                    'nombre' => $data['nombre'],
                    'apaterno' => $data['apaterno'],
                    'amaterno' => $data['amaterno'],
                    'password' => bcrypt($data['password']),
                    'rol_id' => 2
        ]);
    }

    public function getLogin() {
        return view('auth.login');
    }

    public function postLogin(LoginRequest $r) {        
        if (auth()->attempt($r->only(['rut', 'password']), false)) {
            return redirect()->intended();
        } else {
            return back()->withErrors('Usuario y/o clave invalido');
        }
    }

    public function getRegister() {
        return view('auth.register');
    }

    public function postRegister(RegisterRequest $r) {
        $this->create($r->only(['rutfull', 'nombre', 'apaterno', 'amaterno', 'password']));
        flash()->success('Registro exitoso');
        return redirect ('auth/login');
    }
}