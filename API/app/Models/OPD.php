<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OPD extends Model
{
    use HasFactory, HasUuids;

    public $table = 'opds';

    public $fillable = ['name'];

    public function users()
    {
        return $this->hasMany(User::class, 'opd_id');
    }

    public function assets()
    {
        return $this->hasMany(Asset::class, 'opd_id');
    }
}
