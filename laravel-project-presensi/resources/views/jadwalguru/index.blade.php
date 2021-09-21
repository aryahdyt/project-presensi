@extends('partial.master', ['title' => 'History'])

@section('title')
Jadwal Guru
@endsection

@section('page')
<div class="breadcrumb-item active">Jadwal</div>
@endsection

@section('btn-tambah')
<a href="{{ route('jadwalguru.create') }}" class="btn btn-primary"><i class="fas fa-plus"></i></a>
@endsection

@section('content')
<div class="section body">
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-body">
          <div class="h6 font-weight-bold mb-4">
            <span class="h6">Nama Guru : {{ Auth::user()->guru->nama_guru }}</span>
          </div>
          <div class="table-responsive">
            <table class="table table-hover table-bordered text-center">
              <thead>
                <tr>
                  <th>No</th>
                  <th>Tanggal</th>
                  <th>Kelas</th>
                  <th>Jam</th>
                  <th>Mapel</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                @forelse($jadwal as $no => $item)
                <tr>
                  <td style="width: 10%">{{ ++$no }}</td>
                  <td>{{ Carbon\Carbon::parse($item->tanggal)->format('l, d F Y'); }}</td>
                  <td>{{ $item->kelas->kelas }}</td>
                  <td>{{ $item->jam_masuk . ' s/d ' . $item->jam_keluar }}</td>
                  <td>{{ $item->mapel->mapel }}</td>
                  <td style="width: 20%" class="text-center">
                    <div class="btn-group" role="group" aria-label="Basic example">
                      <a href="{{ route('jadwalguru.show',$item->id) }}" class="btn btn-warning btn-sm">
                        <i class="fas fa-eye"></i>
                      </a>
                  </td>
                </tr>
                @empty
                <tr>
                  <td colspan="5" align="center">Tidak Ada Data</td>
                </tr>
                @endforelse
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection