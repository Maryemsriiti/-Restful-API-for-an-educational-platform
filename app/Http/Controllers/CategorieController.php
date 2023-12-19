<?php

namespace App\Http\Controllers;

use App\Models\Categorie;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Facades\DB;


class CategorieController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $category = Categorie::all();
        if ($category->isEmpty()) {
            return response()->json(["message" => "No category available"], 200);
        }
        else
          return response($category,200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
         //Validation
         $CategoryValidation = $request->validate([
            "title" => ["required","String","min:2","max:30",],
            "description" => ["required","String","min:2"],
            "user_id" => ["required","numeric"],

          ]);
          
        $category = Categorie::create([
          "title" => $CategoryValidation["title"],
          "description" => $CategoryValidation["description"],
          "user_id" => $CategoryValidation["user_id"],
        ]);
     
       
       return response()->json(["category" => $category],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Categorie  $categorie
     * @return \Illuminate\Http\Response
     */
    public function show(Categorie $id)
    {
        return Categorie::find($id)->first();
        // $category = DB::table("categories")
        // ->join("users","categories.user_id","=","users.id")
        // ->select("categories.*","users.user_name","users.email")
        // ->where("categories.id","=",$id)
        // ->get();     
        // return $category;

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Categorie  $categorie
     * @return \Illuminate\Http\Response
     */
    public function edit(Categorie $categorie)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Categorie  $categorie
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //Validation
        $CategoryValidation = $request->validate([
            "title" => ["String","min:2","max:30",],
            "description" => ["String","min:2"],
            "user_id" => ["required","numeric"],

          ]);
       $category = Categorie::find($id);

        if(!$category){
            return response(["message" => "no category is available"],404);
        }

        $category->update($CategoryValidation);
        return response(["message" => "Category updated"],201);  
   //     return response($categori,200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Categorie  $categorie
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Categorie::find($id);
        if(!$category){
            return response(["message" => "no category is available"],404);
        }
        $value = Categorie::destroy($id);
        if(boolval($value) == false){
            return response(["message" => "no category is available"],404);
        }
        return response(["message" => "Category removed"],200);
    }

    public function search($title)
    {
        return Categorie::Where('title','like','%'.$title.'%')->get();
     /*  $category = Categorie::Where('Title','like','%'.$Title.'%');
       if(!$category){
        return response(["message" => "no category is available"],404);
    }
        return response()->json(["category" => $category],200);
          
    */
    }
}
