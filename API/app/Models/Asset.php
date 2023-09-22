<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Asset extends Model
{
    use HasFactory, HasUuids;

    public $fillable = ['opd_id', 'name', 'type'];

    public function opd()
    {
        return $this->belongsTo(OPD::class);
    }
}
