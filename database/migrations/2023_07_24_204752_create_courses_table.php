<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCoursesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('courses', function (Blueprint $table) {
            $table->id();
            $table->string("Title")->nullable(false);
            $table->text("description")->nullable(false);
            $table->string("Course_level");
            $table->string("duration");
            $table->string("price")->nullable(false);
            $table->string('image')->nullable(false);
            $table->unsignedBigInteger("Category_id")->nullable(false);
            $table->foreign("Category_id")->references("id")->on("categories")->onDelete("cascade");
            $table->unsignedBigInteger("user_id")->nullable(false);
            $table->foreign("user_id")->references("id")->on("users")->onDelete("cascade");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('courses');
    }
}
