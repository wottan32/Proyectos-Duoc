<?php

namespace CertificaDev;

use Illuminate\Database\Eloquent\Model;

class Educacion extends Model {

    protected $table = 'educacion';
    public $timestamps = false;

    public function postulaciones() {
        return $this->hasMany('CertificaDev\\Postulacion');
    }

}
