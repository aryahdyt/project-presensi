<?php

namespace App\Http\Controllers;

use App\Models\AbsenDaring;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HistoryController extends Controller
{
    public function index()
    {
        $user_id = Auth::user()->siswa->id;
        $historySiswa = AbsenDaring::where('siswa_id', $user_id)->latest()->get();
        // dd($historySiswa);
        // dd($user_id);

        return view('history.index', ['historySiswa' => $historySiswa]);
    }

    public function show(AbsenDaring $history)
    {
        // dd($history);
        return view('history.show', ['history' => $history]);
    }
}
