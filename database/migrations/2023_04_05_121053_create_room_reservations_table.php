<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('room_reservations', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('reservation_id');
            $table->unsignedBigInteger('room_id');

            $table->foreign('reservation_id')
                  ->references('id')
                  ->on('reservations');

            $table->foreign('room_id')
                  ->references('id')
                  ->on('rooms');
                  
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
        Schema::dropIfExists('room_reservations');
    }
};