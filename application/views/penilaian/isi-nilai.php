<!-- Begin Page Content -->
<div class="container-fluid">

    <div class="row">
        <div class="col-lg">

            <?= $this->session->flashdata('message'); ?>
            <div class="row" style="color:#00264d;">
                <div class="col-8">
                    <h4>Kegiatan: <?= $kegiatan['nama'] ?></h4>
                    <h4>Pencacah: <?= $mitra['nama'] ?></h4>
                    <a href="<?= base_url('penilaian/daftar_pencacah/') . $kegiatan['id'] . "/" . $id_peg; ?>" class="btn btn-info">kembali</a>
                </div>
                <div class="col-4" align=right>
                    <h4>Keterangan
                        <h6>1 : Kurang baik</h6>
                        <h6>5 : Sangat baik sekali</h6>
                    </h4>

                </div>
            </div>
            <br>
            <div class="table-responsive">
                <table class="table table-borderless table-hover">
                    <thead style="background-color: #00264d; color:#e6e6e6;">
                        <tr align=center>

                            <th scope="col">Kriteria</th>
                            <th scope="col">Nilai</th>
                        </tr>
                    </thead>
                    <tbody style="background-color: #ffffff; color: #00264d;">


                        <?php $i = 1; ?>
                        <?php foreach ($kriteria as $k) : ?>
                            <tr align=center>
                                <td align="left"><?= $k['nama']; ?></td>
                                <td>
                                    <?php for ($i = 1; $i < 6; $i++) : ?>
                                        <div class="form-check form-check-inline">
                                            <input class="form-nilai-input" type="checkbox" <?php $value = $i; ?> <?= check_nilai($all_kegiatan_pencacah['id'], $k['id'], $value); ?> data-all_kegiatan_pencacah_id="<?= $all_kegiatan_pencacah['id']; ?>" data-kegiatan_id="<?= $kegiatan['id']; ?>" data-id_mitra="<?= $mitra['id_mitra']; ?>" data-kriteria="<?= $k['id']; ?>" data-nilai="<?= $value; ?>" data-peg="<?= $id_peg; ?>">


                                            <!-- <input class="form-nilai-input" type="checkbox" <?php $value = $i; ?> <?= check_nilai($kegiatan['id'], $mitra['id_mitra'], $k['id'], $value); ?> data-kegiatan_id="<?= $kegiatan['id']; ?>" data-id_mitra="<?= $mitra['id_mitra']; ?>" data-kriteria="<?= $k['id']; ?>" data-nilai="<?= $value; ?>"> -->
                                            <label class="form-check-label">&nbsp;&nbsp;<?= $i ?></label>
                                        </div>
                                    <?php endfor; ?>
                                </td>
                            </tr>
                            <?php $i++; ?>
                        <?php endforeach; ?>

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