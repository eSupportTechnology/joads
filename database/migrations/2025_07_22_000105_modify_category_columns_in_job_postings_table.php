<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('job_postings', function (Blueprint $table) {
            // Drop foreign key constraints only
            $table->dropForeign(['category_id']);
            $table->dropForeign(['subcategory_id']);

            // Modify the columns to string (for storing comma-separated values)
            $table->string('category_id')->nullable()->change();
            $table->string('subcategory_id')->nullable()->change();
        });
    }

    public function down()
    {
        Schema::table('job_postings', function (Blueprint $table) {
            // Change columns back to unsignedBigInteger
            $table->unsignedBigInteger('category_id')->nullable()->change();
            $table->unsignedBigInteger('subcategory_id')->nullable()->change();

            // Re-add foreign key constraints
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
            $table->foreign('subcategory_id')->references('id')->on('subcategories')->onDelete('cascade');
        });
    }
};
