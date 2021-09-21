<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AbsenRequest extends FormRequest
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
     * @return array
     */
    public function rules()
    {
        return [
            'pembahasan' => 'required',
            'kehadiran' => 'required',
            // 'bukti' => 'required',
            // 'image' => 'mimes:jpeg,png,jpg|max:2048',
        ];
    }

    public function messages()
    {
        return [
            'pembahasan.required' => 'Pembahasan wajib diisi.',
            'kehadiran.required' => 'Kehadiran wajib diisi.',
            // 'bukti.required' => 'Content wajib diisi.',
        ];
    }
}
