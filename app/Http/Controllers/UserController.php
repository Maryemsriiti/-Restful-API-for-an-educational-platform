<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Facades\Mail;
use App\Mail\InscriptionMail;
use Illuminate\Support\Facades\Auth;


class UserController extends Controller
{
 
        public function signUp(Request $request){
          //Validation
            $utilisateurDonnee = $request->validate([
                
                "user_name" => ["required","String","min:2","max:30", "regex:/^[^()+@#!]+$/"],
                "email" => ["required","email","unique:users,email"],
                "password" => ["required","String","min:8","max:30","confirmed"]
            ]);
            $utilisateurs = User::create([
                
                "user_name" => $utilisateurDonnee["user_name"],
                "email" => $utilisateurDonnee["email"],
                "password" => bcrypt($utilisateurDonnee["password"])
            ]);
           //pour envoyer un email a l'utilisateur apres l'inscription
        //  $info = [
        //         "user_name" => $utilisateurDonnee["user_name"],
        //         "email" => $utilisateurDonnee["email"],
        //     ];
            
        //     Mail::to($utilisateurDonnee["email"])->send(new InscriptionMail($info));

       
      //  return response()->json($utilisateurs,201);
      $token = $utilisateurs->createToken("Cle_SECRETE")->plainTextToken;
      return response()->json([
        "utilisateur" => $utilisateurs,
        "token" => $token
      ],200);
    }
  
    public function LogIn(Request $request){
        //Validation pour la connection
          $utilisateurDonnee = $request->validate([
               "email" => ["required","email"],
               "password" => ["required","String","min:8","max:30"]
          ]);
          $utilisateur = User::where("email",$utilisateurDonnee["email"])->first();
          if(!$utilisateur) return response(["message"=>"Your email or password is not
           correct! "],401);
          if(!Hash::check($utilisateurDonnee["password"],$utilisateur->password)) 
          return response(["message"=>"Your email or password is not correct! "],401);
        
          $token = $utilisateur->createToken("Cle_SECRETE")->plainTextToken;
          return response()->json([
            "utilisateur" => $utilisateur,           
            "token" => $token
          ],200);
            }


         // LogOut function
       public function Logout(Request $request){
                
            // Vérifier si l'utilisateur est authentifié
            if (Auth::check()) {
              // Supprimer tous les tokens d'accès de l'utilisateur
              auth()->user()->tokens()->delete();
              return response()->json(["message" => "Logged Out"], 200);
          }

            return response()->json(["message" => "User is not authenticated"], 401);
              }


          // public function Logout(){
          //   auth()->user()->tokens->each(function($token,$key){
          //       $token->delete();
          //   });


      // public function logout()
      // {
      // Auth::logout();
      // return response()->json(['message' => 'Déconnecté avec succès.']);
      // }
    
     public function index()   // afficher tous les utilisateurs
     {
         $user = User::all();
         if ($user->isEmpty()) {
             return response()->json(["message" => "No user "], 200);
         }
         else
           return response($user,200);
     }

     public function show(User $id)
     {
        return User::find($id);
      }
       
      public function update(Request $request, $id)
    {
        //Validation
        $UserValidation = $request->validate([
          
          "user_name" => ["String","min:2","max:30", "regex:/^[^()+@#!]+$/"],
          "email" => ["email","unique:users,email"],
          "password" => ["String","min:8","max:30","confirmed"],
          "is_admin" => ["boolean"],
         // "role" => ["numeric"],
      ]);
       $user = User::find($id);
        
        if(!$user){
            return response(["message" => "no user "],404);
        }

        $user->update($UserValidation);
        return response(["message" => "User updated"],201);  
   //     return response($user,200);
    }
    
    public function destroy($id)
    {
        $user = User::find($id);
        if(!$user){
            return response(["message" => "No user is available"],404);
        }
        $value = User::destroy($id);
        if(boolval($value) == false){
            return response(["message" => "No user is available"],404);
        }
        return response(["message" => "User removed"],200);
    }

    public function search($user_name)
    {
        return User::Where('user_name','like','%'.$user_name.'%')->get();
     
    }
    
    public function search_admin($is_admin)
    {
        return User::Where('is_admin','like','%'.$is_admin.'%')->get();
     
    }
}

    

