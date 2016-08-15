<?php

namespace CertificaDev;

use Illuminate\Database\Eloquent\Model;

class Comuna extends Model {

    protected $table = 'comuna';
    public $timestamps = false;

    public function postulaciones() {
        return $this->hasMany('CertificaDev\\Postulacion');
    }

}
