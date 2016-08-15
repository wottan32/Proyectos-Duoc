<?php

namespace CertificaDev;

use Illuminate\Database\Eloquent\Model;

class Rol extends Model {

    protected $table = 'rol';
    public $timestamps = false;

    public function users() {
        return $this->hasMany('CertificaDev\\User');
    }

}
