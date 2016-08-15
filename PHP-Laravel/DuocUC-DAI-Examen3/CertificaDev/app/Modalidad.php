<?php

namespace CertificaDev;

use Illuminate\Database\Eloquent\Model;

class Modalidad extends Model {

    protected $table = 'modalidad';
    public $timestamps = false;

    public function postulaciones() {
        return $this->hasMany('CertificaDev\\Postulacion');
    }

}
