<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
    ];

    protected $guarded = [];

    public function courses(){
        return $this->belongsToMany(Course::class,'cart_course');
    }
}
