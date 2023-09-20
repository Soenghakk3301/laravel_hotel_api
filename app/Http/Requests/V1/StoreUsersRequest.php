<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class StoreUsersRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'user_types_id' => 'required|integer',
            'name' => 'required|string',
            'email' => 'required|email|unique',
            'password' => 'required',
            'gender' => 'required|string',
            'phone_number' => 'required|string|max:15',
        ];
    }
}