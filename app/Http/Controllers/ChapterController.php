<?php

namespace App\Http\Controllers;

use App\Models\Chapter;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Collection;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Facades\DB;

class ChapterController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $chapter = Chapter::all();
        if ($chapter->isEmpty()) {
            return response()->json(["message" => "No chapter available"], 200);
        }
        else
          return response($chapter,200);
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
        $ChapterValidation = $request->validate([
            "Title" => ["required","String","min:2"],
            "order" => ["required","numeric"],
            "youtube_link" => ["string"],
            "content" => ["string"],
            "course_id" => ["required","numeric"],
          ]);

         
        $chapter = Chapter::create([
          "Title" => $ChapterValidation["Title"],
          "order" => $ChapterValidation["order"],
          "youtube_link" => $ChapterValidation["youtube_link"],
          "content" => $ChapterValidation["content"],
          "course_id" => $ChapterValidation["course_id"],
        ]);
     
    
       return response()->json(["chapter" => $chapter],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Chapter  $chapter
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return Chapter::find($id)->first();
        // $chapter = DB::table("chapters")
        // ->join("courses","chapters.course_id","=","courses.id")
        // ->select("chapters.*","courses.Title","courses.description")
        // ->where("chapters.id","=",$id)
        // ->get()
        // ->first();
        // return $chapter;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Chapter  $chapter
     * @return \Illuminate\Http\Response
     */
    public function edit(Chapter $chapter)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Chapter  $chapter
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        //Validation
        $ChapterValidation = $request->validate([
            "Title" => ["String","min:2"],
            "order" => ["numeric"],
            "youtube_link" => ["string"],
            "content" => ["string"],
            "course_id" => ["required","numeric"],
          ]);
       $chapter = Chapter::find($id);

        if(!$chapter){
            return response(["message" => "no category is available"],200);
        }

        $chapter->update($ChapterValidation);
        return response(["message" => "Chapter updated"],201);  
   //     return response($chapter,200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Chapter  $chapter
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $chapter = Chapter::find($id);
        if(!$chapter){
            return response(["message" => "no chapter is available"],200);
        }
        $value = Chapter::destroy($id);
        if(boolval($value) == false){
            return response(["message" => "no chapter is available"],200);
        }
        return response(["message" => "Chapter removed"],200);
    }

    public function search($Title)
    {
        return Chapter::Where('Title','like','%'.$Title.'%')->get();
    //    $chapter = Chapter::Where('Title','like','%'.$Title.'%');
    //    if(!$chapter){
    //     return response(["message" => "no chapter is available"],200);
    // }
    //     return response()->json(["chapter" => $chapter],200);
          
    
    }
}
