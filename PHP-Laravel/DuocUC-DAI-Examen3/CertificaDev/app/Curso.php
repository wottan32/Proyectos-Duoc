<?php

namespace CertificaDev;

use Illuminate\Database\Eloquent\Model;

class Curso extends Model {

    protected $table = 'curso';


    public function postulaciones() {
        return $this->hasMany('CertificaDev\\Postulacion');
    }

}
