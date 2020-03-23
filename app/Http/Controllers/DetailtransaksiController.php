<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Detailtransaksi;
use App\Jeniscuci;
use App\Transaksi;
use Auth;
use DB;
use Illuminate\Support\Facades\Validator;

class DetailtransaksiController extends Controller
{
    

    public function store(Request $request){
        if(Auth::user()->level=="petugas"){
          $validator=Validator::make($request->all(),
            [
            'id_transaksi'=>'required',
            'id_jenis'=>'required',
            'qty'=>'required',
            
            ]
          );
    
          if($validator->fails()){
            return Response()->json($validator->errors());
          }
          
          $idJenis = $request->id_jenis;
          $harga = DB::table('jenis_cuci')->where('id', $idJenis)->first();

          $hargaTotal = $harga->harga_per_kilo;
          //var_dump($harga);

         $subtotal = $hargaTotal * $request->qty;
          //print_r($subtotal);

          //print_r($subtotal);
          $simpan=Detailtransaksi::create([
            'id_transaksi'=>$request->id_transaksi,
            'id_jenis'=>$request->id_jenis,
            'subtotal'=>$subtotal,
            'qty'=> (int)$request->qty
            
          ]);
          $status=1;
          $message="Detail Transaksi Berhasil Ditambahkan";
          if($simpan){
            return Response()->json(compact('status','message'));
          }else {
            return Response()->json(['status'=>0]);
          }
        }
        else{
            return response()->json(['status'=>'Anda bukan petugas']);
            }
        }
    
        public function update($id,Request $request){
          if(Auth::user()->level=="petugas"){
          $validator=Validator::make($request->all(),
            [
                'id_transaksi'=>'required',
                'id_jenis'=>'required',
                'qty'=>'required'
            ]
        );
    
        if($validator->fails()){
          return Response()->json($validator->errors());
        }
        $idJenis = $request->id_jenis;
          $harga = DB::table('jenis_cuci')->where('id', $idJenis)->first();

          $hargaTotal = $harga->harga_per_kilo;
          //var_dump($harga);

         $subtotal = $hargaTotal * $request->qty;
    
        $ubah=Detailtransaksi::where('id',$id)->update([
            'id_transaksi'=>$request->id_transaksi,
            'id_jenis'=>$request->id_jenis,
            'qty'=>$request->qty,
            'subtotal'=>$subtotal
        ]);
        $status=1;
        $message="Detail Transaksi Berhasil Diubah";
        if($ubah){
          return Response()->json(compact('status','message'));
        }else {
          return Response()->json(['status'=>0]);
        }
      }
        else{
          return response()->json(['status'=>'anda bukan petugas']);
          }
      }
    
    
    //   public function tampil(){
    //     $DT=Detailtransaksi::orderBy("tgl","ASC")
    //     ->join('transaksi','transaksi.id','detail_transaksi.id_trans')
    //       ->join('jenis_cuci','jenis_cuci.id','detail_transaksi.id_jenis')
    //       ->where('detail_transaksi.tgl_transaksi'>=$tgl_transaksi)
    //       ->where('tgl_transaksi'<=$tgl_selesai)
    //       ->select('pelanggan.id','pelanggan.nama','film_tayang.waktu','film.nama_film','film.deskripsi','studio.nama_studio')
    //       ->get();
    //     $count=$DT->count();
    //     return response()->json(compact('tiket','count'));
    //   }
    
      public function destroy($id){ 
        if(Auth::user()->level=="petugas"){
        $hapus=Detailtransaksi::where('id',$id)->delete();
        $status=1;
        $message="Detail Transaksi Berhasil Dihapus";
        if($hapus){
          return Response()->json(compact('status','message'));
        }else {
          return Response()->json(['status'=>0]);
        }
      }
      else{
        return response()->json(['status'=>'anda bukan petugas']);
      }
    }
}