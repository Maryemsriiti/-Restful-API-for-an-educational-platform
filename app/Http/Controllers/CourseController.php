<?php

namespace App\Http\Controllers;

use App\Models\Course;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Laravel\Sanctum\HasApiTokens;

class CourseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $course = Course::all();
        if($course->isEmpty()){
              return response(["message" => "No course available"],200) ;
          }
        else
              return response($course,200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
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
          $CourseValidation = $request->validate([
            "Title" => ["required","String","min:2","max:30",],
            "description" => ["required","String","min:2"],
            "Course_level" => ["String","min:2"],
            "duration" => ["String","min:2"],
            "image" => ["required","mimes:png,jpeg,jpg","max:1024"],
            "price" => ["required","String"],
            "user_id" => ["required","numeric"],
            "category_id" => ["required","numeric"],
          ]);
          $path = $request->file("image")->store("public/images_Course");
        $course = Course::create([
          "Title" => $CourseValidation["Title"],
          "description" => $CourseValidation["description"],
          "Course_level" => $CourseValidation["Course_level"],
          "duration" => $CourseValidation["duration"],
          "price" => $CourseValidation["price"],
          "image" => $path,
          "user_id" => $CourseValidation["user_id"],
          "category_id" => $CourseValidation["category_id"],
        ]);
     
       
       return response()->json(["course" => $course],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function show(Course $id)
    {
        return Course::find($id)->first();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function edit(Course $course)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        //Validation
        $CourseValidation = $request->validate([
            "Title" => ["String","min:2","max:30",],
            "description" => ["String","min:2"],
            "Course_level" => ["String","min:2"],
            "duration" => ["String","min:2"],
            "price" => ["String","min:2"],
            "image" => ["String"],
            "user_id" => ["required","numeric"],
            "category_id" => ["required","numeric"],
          ]);
       $course = Course::find($id);

        if(!$course){
            return response(["message" => "no course is available"],404);
        }

        $course->update($CourseValidation);
        return response(["message" => "Course updated"],201);  
   //     return response($course,200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $course = Course::find($id);
        if(!$course){
            return response(["message" => "no course is available"],404);
        }
        $value = Course::destroy($id);
        if(boolval($value) == false){
            return response(["message" => "no course is available"],404);
        }
        return response(["message" => "Course removed"],200);
    }

    public function search($Title)
    {
        return Course::Where('Title','like','%'.$Title.'%')->get();
    //    $course = Course::Where('Title','like','%'.$Title.'%');
    //    if(!$course){
    //     return response(["message" => "no course is available"],404);
    //      }
    //     return response()->json(["course" => $course],200);
          
    
    }

    public function derniersCours()
    {
        // Récupérer les 6 derniers cours triés par date d'ajout (du plus récent au plus ancien)
        $derniersCours = Course::latest()->take(6)->get();

        // Formater les données en JSON et les renvoyer en réponse
        return response()->json($derniersCours);
    }


}
