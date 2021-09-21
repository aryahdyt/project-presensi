@extends('partial.master', ['title' => 'Absen'])

@section('title')
Absen Siswa <span class="h6 text-muted text-monospace">{{ $now }}</span>
@endsection

@section('page')
<div class="breadcrumb-item active">Absen</div>
@endsection

@section('content')
<div class="row">
  <div class="col-12">
    <div class="card p-5">
      @if ($jadwal_kelas)
      @if ($first_absen)
      Kamu sudah absen hari ini
      @else
      <div class="h6 font-weight-bolder text-center mb-4">
        Mata Pelajaran : <span class="">{{ $jadwal_kelas->mapel->mapel }}</span> by {{ $jadwal_kelas->guru->nama_guru }}
      </div>
      <form method="POST" action="{{ route('absen.store') }}" enctype="multipart/form-data">
        @csrf

        <div class="form-group row mb-2 mx-5">
          <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3 text-dark">
            Topik Pembahasan
          </label>
          <div class="col-sm-12 col-md-7">
            <input type="text" class="form-control  @error('pembahasan') is-invalid @enderror" name="pembahasan"
              value="{{ old('pembahasan', '') }}" placeholder="Masukan Topik Pembahasan">

            @error('pembahasan')
            <div class="invalid-feedback" style="display: block">
              {{ $message }}
            </div>
            @enderror
          </div>
        </div>

        <div class="form-group row mb- mx-5">
          <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3 text-dark">
            Kehadiran
          </label>
          <div class="col-sm-12 col-md-7 pt-1">
            <div class="form-check">
              <input class="form-check-input @error('kehadiran') is-invalid @enderror" type="radio" name="kehadiran"
                value="Hadir">
              <label class="form-check-label">
                Hadir
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input @error('kehadiran') is-invalid @enderror" type="radio" name="kehadiran"
                value="Izin">
              <label class="form-check-label">
                Izin
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input @error('kehadiran') is-invalid @enderror" type="radio" name="kehadiran"
                value="Sakit">
              <label class="form-check-label">
                Sakit
              </label>
            </div>

            @error('kehadiran')
            <div class="invalid-feedback" style="display: block">
              {{ $message }}
            </div>
            @enderror
          </div>
        </div>

        <div class="form-group row mb-2 mx-5">
          <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3 text-dark">
            Bukti Kehadiran
          </label>
          <div class="col-sm-12 col-md-7">
            <input class="form-control" type="file" name="bukti">
          </div>
        </div>

        <div class="row mt-4">
          <!-- /.col -->
          <div class="col-4 m-auto">
            <a href="javascript:void(0)" onclick="window.history.back();" class="btn btn-outline-primary"><i
                class="fas fa-arrow-left"></i></a>
            <button type="reset" class="btn btn-danger">
              <i class="fas fa-redo"></i>
            </button>
            <button type="submit" class="btn btn-primary">
              {{ __('Tambah') }}
            </button>
          </div>
          <!-- /.col -->
        </div>

      </form>
      @endif
      @else
      Belum Ada Jadwal
      @endif
    </div>
  </div>
</div>
@endsection

@push('script')
<script>
  @if(session()->has('success'))

        toastr.success('{{ session('success') }}', 'BERHASIL!');

    @elseif(session()->has('error'))

        toastr.error('{{ session('error') }}', 'GAGAL!');

    @endif
</script>
@endpush