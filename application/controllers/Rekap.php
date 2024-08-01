<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Rekap extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
    }

    public function bk_pegawai()
    {
        $data['title'] = 'Beban Kerja Pegawai';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();



        $query_rekap = "SELECT pegawai.nama, pegawai.id_peg, count(all_kegiatan_pengawas.kegiatan_id) as jk FROM pegawai LEFT JOIN all_kegiatan_pengawas ON (pegawai.id_peg = all_kegiatan_pengawas.id_pengawas) GROUP BY pegawai.id_peg ORDER BY jk DESC";
        $data['rekap'] = $this->db->query($query_rekap)->result_array();

        // var_dump($data['rekap']);
        // die;



        $this->load->view('template/header', $data);
        $this->load->view('template/sidebar', $data);
        $this->load->view('template/topbar', $data);
        $this->load->view('rekap/bkp', $data);
        $this->load->view('template/footer');
    }

    public function bk_mitra()
    {
        $data['title'] = 'Beban Kerja Mitra';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

        $query_rekap = "SELECT mitra.nama, mitra.id_mitra, count(all_kegiatan_pengawas.kegiatan_id) as jk, count(all_kegiatan_pencacah.kegiatan_id) as jk_p FROM mitra LEFT JOIN all_kegiatan_pengawas ON (mitra.id_mitra = all_kegiatan_pengawas.id_pengawas) LEFT JOIN all_kegiatan_pencacah ON (mitra.id_mitra = all_kegiatan_pencacah.id_mitra) GROUP BY mitra.id_mitra ORDER BY jk, jk_p DESC";
        $data['rekap'] = $this->db->query($query_rekap)->result_array();

        $this->load->view('template/header', $data);
        $this->load->view('template/sidebar', $data);
        $this->load->view('template/topbar', $data);
        $this->load->view('rekap/bkm', $data);
        $this->load->view('template/footer');
    }

    public function details_pegawai($id_peg)
    {
        $data['title'] = 'Details Kegiatan Pegawai';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

        $sql = "SELECT all_kegiatan_pengawas.*, kegiatan.nama as namakeg, kegiatan.start, kegiatan.finish, pegawai.nama as pegawainama FROM all_kegiatan_pengawas INNER JOIN kegiatan ON all_kegiatan_pengawas.kegiatan_id = kegiatan.id INNER JOIN pegawai ON pegawai.id_peg = $id_peg  WHERE all_kegiatan_pengawas.id_pengawas = $id_peg ORDER BY kegiatan.start";
        $data['details'] = $this->db->query($sql)->result_array();

        $data['pegawai'] = $this->db->get_where('pegawai', ['id_peg' => $id_peg])->row_array();

        $this->load->view('template/header', $data);
        $this->load->view('template/sidebar', $data);
        $this->load->view('template/topbar', $data);
        $this->load->view('rekap/details-bkp', $data);
        $this->load->view('template/footer');
    }

    public function details_mitra($id_mitra)
    {
        $data['title'] = 'Details Kegiatan Mitra';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
    }
}
