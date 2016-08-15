<?php

namespace CertificaDev;

use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable {

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'usuario';
    public $timestamps = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id', 'rut', 'nombre', 'apaterno', 'amaterno', 'password', 'rol_id'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function getAuthIdentifier() {
        return $this->id;
    }

    public function getAuthPassword() {
        return $this->password;
    }

    public function getRememberToken() {
        return null; // not supported
    }

    public function setRememberToken($value) {
        // not supported
    }

    public function getRememberTokenName() {
        return null; // not supported
    }

    /**
     * Overrides the method to ignore the remember token.
     */
    public function setAttribute($key, $value) {
        $isRememberTokenAttribute = $key == $this->getRememberTokenName();
        if (!$isRememberTokenAttribute) {
            parent::setAttribute($key, $value);
        }
    }

    public function rol() {
        return $this->belongsTo('CertificaDev\\Rol');
    }

    public function postulaciones() {
        return $this->hasMany('CertificaDev\\Postulacion');
    }
    
    public function isEjecutivo() {
        return $this->rol->nombre === "ejecutivo";
    }
       public function hasRol($rol) {
        return $this->rol->nombre === $rol;
    }

}
