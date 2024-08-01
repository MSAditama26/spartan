<!-- Begin Page Content -->
<div class="container-fluid">

    <div class="row">
        <div class="col-lg">

            <div class="dropdown mb-3">
                <button type="button" class="btn btn-primary dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-expanded="false" data-offset="10,20">
                    Periode Waktu
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                    <a class="dropdown-item" href="#">Tahunan</a>
                    <a class="dropdown-item" href="#">Januari</a>
                    <a class="dropdown-item" href="#">Februari</a>
                    <a class="dropdown-item" href="#">Maret</a>
                    <a class="dropdown-item" href="#">April</a>
                    <a class="dropdown-item" href="#">Mei</a>
                    <a class="dropdown-item" href="#">Juni</a>
                    <a class="dropdown-item" href="#">Juli</a>
                    <a class="dropdown-item" href="#">Agustus</a>
                    <a class="dropdown-item" href="#">September</a>
                    <a class="dropdown-item" href="#">Oktober</a>
                    <a class="dropdown-item" href="#">November</a>
                    <a class="dropdown-item" href="#">Desember</a>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-borderless table-hover" id="mydata">
                    <thead style="background-color: #00264d; color:#e6e6e6;">
                        <tr align=center>
                            <th scope="col">#</th>
                            <th scope="col">Nama</th>
                            <th scope="col">Pengawasan</th>
                            <th scope="col">Action</th>

                        </tr>
                    </thead>
                    <tbody style="background-color: #ffffff; color: #00264d;">
                        <?php $i = 1; ?>
                        <?php foreach ($rekap as $r) : ?>
                            <tr align=center>
                                <th scope="row"><?= $i; ?></th>
                                <td><?= $r['nama']; ?></td>
                                <td><?= $r['jk']; ?></td>
                                <td>
                                    <a href="<?= base_url('rekap/details_pegawai/') . $r['id_peg']; ?>" class="badge badge-success">details kegiatan</a>
                                </td>
                            </tr>
                            <?php $i++; ?>
                        <?php endforeach ?>
                    </tbody>
                </table>
            </div>

        </div>

    </div>
    <br>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->