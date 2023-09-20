<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert(
            [
              [
                 'name' => 'Admin',
                 'user_types_id' => 1,
                 'email' => 'admin@gmail.com',
                 'password' => Hash::make('111'),
                 'phone_number' => '11111111',
                 'gender' => 'male',
              ],

              // agent
              [
                 'name' => 'sok',
                 'user_types_id' => 2,
                 'email' => 'sok@gmail.com',
                 'password' => Hash::make('111'),
                 'phone_number' => '11111111',
                 'gender' => 'male',
              ],

              // user
              [
                 'name' => 'User',
                 'user_types_id' => 3,
                 'email' => 'user@gmail.com',
                 'password' => Hash::make('111'),
                 'phone_number' => '11111111',
                 'gender' => 'male',
              ]
         ]
        );
    }
}