@extends('partial.master', ['title' => 'History'])

@section('title')
History Absen Siswa
@endsection

@section('page')
<div class="breadcrumb-item active">History</div>
@endsection

@section('content')

<div class="section body">
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-body">
          <div class="h6 font-weight-bold mb-4">
            <span class="h6">Nama Siswa : {{ Auth::user()->siswa->nama_lengkap }}</span>
          </div>
          <div class="table-responsive">
            <table class="table table-hover table-bordered text-center">
              <thead>
                <tr>
                  <th>No</th>
                  <th>Tanggal</th>
                  <th>Kehadiran</th>
                  {{-- <th>Tanggal</th> --}}
                  <th>Bukti</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                @forelse($historySiswa as $no => $item)
                <tr>
                  <td style="width: 10%">{{ ++$no }}</td>
                  <td>{{ $item->tanggal() }}</td>
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
                  {{-- <td>{{ $no->tanggal}}</td> --}}
                  <td>Bukti Gambar</td>
                  <td style="width: 20%" class="text-center">
                    <div class="btn-group" role="group" aria-label="Basic example">
                      <a href="{{ route('history.show',$item->id) }}" class="btn btn-warning btn-sm">
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