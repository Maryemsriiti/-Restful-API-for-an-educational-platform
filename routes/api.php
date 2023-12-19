<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CategorieController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\ChapterController;
use App\Http\Controllers\CartController;

// Public Routes

    Route::post('user/signUp',[UserController::class,"signUp"]);
    Route::post('user/LogIn',[UserController::class,"LogIn"]);
    Route::post('user/LogOut',[UserController::class,"Logout"]);


// Admin Routes
Route::middleware(['auth:sanctum','admin'])->group(function(){


    // User Route
    Route::get('Users',[UserController::class,"index"])->middleware('admin');
    Route::get('Users/{id}',[UserController::class,"show"])->middleware('admin');
    Route::put('Users/{id}',[UserController::class,"update"])->middleware('admin');
    Route::delete('Users/{id}',[UserController::class,"destroy"])->middleware('admin');
    Route::get('Users/search/{user_name}',[UserController::class,"search"])->middleware('admin');
    Route::get('Users/admin/{role}',[UserController::class,"search_admin"])->middleware('admin');

    //Category Route 
    Route::post('Categories/Store',[CategorieController::class,"store"]); //->middleware('admin');
    Route::put('Category/{id}',[CategorieController::class,"update"])->middleware('admin');  
    Route::delete('Category/{id}',[CategorieController::class,"destroy"])->middleware('admin');
    
    //Course Route 
    Route::post('Courses/Store',[CourseController::class,"store"]); //->middleware('admin');
    Route::put('Course/{id}',[CourseController::class,"update"])->middleware('admin'); 
    Route::delete('Course/{id}',[CourseController::class,"destroy"])->middleware('admin');

    //Chapter Route 
    Route::post('Chapters/Store',[ChapterController::class,"store"])->middleware('admin');
    Route::put('Chapter/{id}',[ChapterController::class,"update"])->middleware('admin');
    Route::delete('Chapter/{id}',[ChapterController::class,"destroy"])->middleware('admin');
}); 
// Protected Routes
Route::group(['middleware' => ['auth:sanctum']],function(){

    // User Route
    // Route::post('user/LogOut',[UserController::class,"Logout"]);
    Route::put('Users/{id}',[UserController::class,"update"]);

    //Category Route 
    Route::get('Categories',[CategorieController::class,"index"]);
    Route::get('Categories/{id}',[CategorieController::class,"show"]);  
    Route::get('Category/search/{Title}',[CategorieController::class,"search"]);

    //Course Route 
    Route::get('Courses',[CourseController::class,"index"]);
    Route::get('Course/{id}',[CourseController::class,"show"]);
    Route::get('Chapter/search/{Title}',[ChapterController::class,"search"]);

    //Chapter Route 
    Route::get('Chapters',[ChapterController::class,"index"]);

    //Carts Route
    // Route::post('Cart/{userId}/add_Course/{courseId}',[CartController::class,"addCourseToCart"]); 
    // Route::delete('Carts/{userId}/remove_Course/{courseId}', [CartController::class,"removeCourseFromCart"]);
    // Route::get('Carts/{id}', [CartController::class,"show"]);


});
Route::post('Cart/{userId}/add_Course/{courseId}',[CartController::class,"addCourseToCart"]); 
Route::delete('Carts/{userId}/remove_Course/{courseId}', [CartController::class,"removeCourseFromCart"]);
Route::get('Carts/{id}', [CartController::class,"show"]);

   
Route::get('derniers_cours', [CourseController::class,"derniersCours"]);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
