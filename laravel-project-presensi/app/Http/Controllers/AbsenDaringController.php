<?php

namespace App\Http\Controllers;

use App\Http\Requests\AbsenRequest;
use App\Models\AbsenDaring;
use App\Models\Jadwal;
use App\Models\Siswa;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class AbsenDaringController extends Controller
{
    // public function __construct()
    // {
    //     $this->filesystem = config('voyager.storage.disk');
    // }

    public function index()
    {
        // 
    }

    public function searchJadwal()
    {
        $now = Carbon::now()->format('Y-m-d');
        $now_jam = Carbon::now()->format('H:m:s');

        $user_id = Auth::user()->id;
        $kelas_siswa = Siswa::where('user_id', $user_id)->first();

        $jadwal_kelas = Jadwal::where([
            ['kelas_id', '=', $kelas_siswa->kelas_id],
            ['tanggal', '=', $now],
        ])->first();

        // dd($jadwal_kelas->jam_masuk);
        // dd($now_jam);

        return $jadwal_kelas;
    }

    public function create()
    {
        $jadwal = $this->searchJadwal();

        if ($jadwal) {
            $first_absen = AbsenDaring::where([
                ['jadwal_id', $jadwal->id],
                ['siswa_id', Auth::user()->siswa->id]
            ])->first();
        } else {
            $first_absen = [];
        }

        // dd($first_absen);


        return view('absen.create', [
            'now' => Carbon::now()->format('l, d F Y'),
            'jadwal_kelas' => $jadwal,
            'first_absen' => $first_absen
        ]);
    }

    public function store(Request $request, AbsenRequest $validation)
    {
        $validator = Validator::make($request->all(), $validation->rules(), $validation->messages());

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput($request->all());
        } else {
            if (Auth::user()->siswa) {
                // dd(Auth::user()->siswa->id);
                // dd($this->searchJadwal()->id);

                $absen = AbsenDaring::create([
                    'siswa_id' => Auth::user()->siswa->id,
                    'kelas_id' => Auth::user()->siswa->kelas_id,
                    'pembahasan' => $request->pembahasan,
                    'kehadiran' => $request->kehadiran,
                    'jadwal_id' => $this->searchJadwal()->id,
                ]);
            } else {
                return redirect()->back()->with('error', 'Anda Belum Jadi Siswa');
            }


            // $absen = Absen::create([
            //     'nama_id' => Auth::user()->siswa->id,
            //     'pembahasan' => $request->pembahasan,
            //     'kehadiran' => $request->kehadiran,
            // ]);

            // if ($request->bukti) {


            // $imageName = 'absen-darings/' . time() . '.' . $request->bukti->extension();
            // $path = Storage::putFileAs('public/absen-darings', $request->bukti, $imageName);

            // $absen = Absen::create([
            //     'user_id' => Auth::user()->id,
            //     'image' => $imageName,
            //     'title' => $request->title,
            //     'content' => $request->content,
            // ]);

            // dd(config('voyager.storage.disk'));
            // } else {
            // 
            // }
        }

        return redirect()->route('dashboard')->with('success', 'Anda Sudah Absen Hari Ini.');
    }
}
