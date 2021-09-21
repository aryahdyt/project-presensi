@extends('partial.master', ['title' => 'History'])

@section('title')
Rekap Daring
@endsection

@section('page')
<div class="breadcrumb-item"><a href="{{ route('rekapdaring.indexJadwal') }}">Jadwal</a></div>
<div class="breadcrumb-item active">Jadwal</div>
@endsection

@section('content')
<div class="section body">
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-hover table-bordered text-center">
              <thead>
                <tr>
                  <th>No</th>
                  <th>Nama Siswa</th>
                  <th>Kelas</th>
                  <th>Kehadiran</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                @forelse($absen as $no => $item)
                <tr>
                  <td style="width: 10%">{{ ++$no }}</td>
                  <td>{{ $item->siswa->nama_lengkap }}</td>
                  <td>{{ $item->kelas->kelas }}</td>
                  <td>
                    @if ($item->kehadiran == "Hadir")
                    <span class="badge badge-success">
                      {{ $item->kehadiran }}
                    </span>
                    @elseif($item->kehadiran == "Izin")
                    <span class="badge badge-info">
                      {{ $item->kehadiran }}
                    </span>
                    @elseif($item->kehadiran == "Sakit")
                    <span class="badge badge-dark">
                      {{ $item->kehadiran }}
                    </span>
                    @elseif($item->kehadiran == "Alpa")
                    <span class="badge badge-danger">
                      {{ $item->kehadiran }}
                    </span>
                    @endif
                  </td>
                  <td style="width: 20%" class="text-center">
                    <div class="btn-group" role="group" aria-label="Basic example">
                      <a href="{{ route('rekapdaring.indexRekap',$item->id) }}" class="btn btn-warning btn-sm">
                        <i class="fas fa-eye"></i>
                      </a>
                      <a href="{{ route('rekapdaring.indexRekap',$item->id) }}" class="btn btn-info btn-sm">
                        <i class="fas fa-edit"></i>
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