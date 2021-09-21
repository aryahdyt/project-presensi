@extends('partial.master', ['title' => 'Dashboard'])

@section('title')
dasboard
@endsection

@section('content')
<div class="row">
  <div class="col-lg-6 col-md-6 col-sm-6 col-12">
    <div class="card card-statistic-1">
      <div class="card-icon bg-primary">
        <i class="far fa-address-book"></i>
      </div>
      <div class="card-wrap">
        <div class="card-header">
          <h4>Nama Guru</h4>
        </div>
        <div class="card-body">
          {{ $guru->nama_guru }} &mdash;
          {{-- <span class="h6">{{ $guru->mapel->mapel }}</span> --}}
        </div>
      </div>
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