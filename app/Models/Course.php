<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    use HasFactory;
    protected $fillable = [
        
        'Title',
        'description',
        'Course_level',
        'duration',
        'price',
        'image',
        'user_id',
        'category_id',
   ];
   protected $guarded = [];

   public function carts(){
    return $this->belongsToMany(Cart::class,'cart_course');
}
}
