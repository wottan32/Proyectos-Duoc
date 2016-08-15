<?php

namespace CertificaDev;

use Illuminate\Database\Eloquent\Model;

class Estado extends Model {

    protected $table = 'estado';
    public $timestamps = false;

    public function postulaciones() {
        return $this->hasMany('CertificaDev\\Postulacion');
    }

}
