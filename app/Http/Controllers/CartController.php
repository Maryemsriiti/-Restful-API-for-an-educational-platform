<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;
use App\Models\Course;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    
    public function addCourseToCart(Request $request, $userId, $courseId)
    {
        // Vérifier si l'utilisateur est authentifié
        // if (!Auth::check()) {
        //     return response()->json(['message' => 'Vous devez être connecté pour ajouter un cours au panier.'], 401);
        // }

        // Vérifier si le cours existe
        $course = Course::find($courseId);
        if (!$course) {
            return response()->json(['message' => 'Le cours spécifié n\'existe pas.'], 404);
        }

        // Vérifier si l'utilisateur a déjà un panier
        $cart = Cart::where('user_id', $userId)->first();
        if (!$cart) {
            // Créer un nouveau panier s'il n'existe pas
            $cart = new Cart();
            $cart->user_id = $userId;
            $cart->save();
        }

        // Ajouter le cours au panier
        $cart->courses()->attach($courseId);

        return response()->json(['message' => 'Le cours a été ajouté au panier avec succès.']);
    }

    public function removeCourseFromCart(Request $request, $userId, $courseId)
    {
        // Vérifier si l'utilisateur est authentifié
        // if (!Auth::check()) {
        //     return response()->json(['message' => 'Vous devez être connecté pour supprimer un cours du panier.'], 401);
        // }

        // Vérifier si le cours existe
        $course = Course::find($courseId);
        if (!$course) {
            return response()->json(['message' => 'Le cours spécifié n\'existe pas.'], 404);
        }

        // Vérifier si l'utilisateur a un panier
        $cart = Cart::where('user_id', $userId)->first();
        if (!$cart) {
            return response()->json(['message' => 'Le panier de l\'utilisateur n\'existe pas.'], 404);
        }

        // Supprimer le cours du panier
        $cart->courses()->detach($courseId);

        return response()->json(['message' => 'Le cours a été supprimé du panier avec succès.']);
    }

    public function show($id)
    {
        return Cart::with('courses')->find($id);
    }









    public function index()
    {
        //
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Cart  $cart
     * @return \Illuminate\Http\Response
     */
   

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Cart  $cart
     * @return \Illuminate\Http\Response
     */
    public function edit(Cart $cart)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Cart  $cart
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Cart $cart)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Cart  $cart
     * @return \Illuminate\Http\Response
     */
    public function destroy(Cart $cart)
    {
        //
    }
}
