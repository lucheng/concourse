<?php
class KeditorAction extends Action{
    public function filemanager(){
       import("ORG.Net.Keditor");
       Keditor::filemanager();
    }
    public function upload(){
       import("ORG.Net.Keditor");
       $ke=new Keditor();
       $ke->upload();
    }
}