<?php

namespace CertificaDev\Http\Middleware;

use Closure;

class RolMiddleware {

    public function handle($request, Closure $next, $rol) {
        if ( auth()->user()->hasRol($rol)) {
            return $next($request);
        } else {
            return view('shared.error', ['mensaje' => 'No tienes los permisos necesarios para acceder a este módulo']);
        }
    }

}
