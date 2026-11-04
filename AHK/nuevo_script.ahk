#Requires AutoHotkey v2.0
#SingleInstance Force

MinimizarRAM()
SetTimer(MinimizarRAM, 600000)
MinimizarRAM() {
 hProcess := DllCall("OpenProcess", "UInt", 0x1F0FFF, "Int", 0, "UInt", DllCall("GetCurrentProcessId"), "Ptr") 
 if (hProcess) { 
 DllCall("psapi\EmptyWorkingSet", "Ptr", hProcess)
 DllCall("CloseHandle", "Ptr", hProcess)
 }
}

; *: Inmediato | C: Sensible a caja | ?: Activa dentro de palabras | C1: No mutar con Shift

#Hotstring * C ? SI T

::,,::ː
::,1::ˁ
::,2::ˀ
::,3::ğ
::,5::ş
::,6::š
::,7::ś
::,a::ɑ
::,ç::č
::,e::ə
::,f::ɟ
::,g::ɣ
::,h::ħ
::,i::ɪ
::,j::ʲ
::,l::ɬ
::,m::̃
::,ñ::ɲ
::,n::ŋ
::,o::ɔ
::,q::ć
::,r::ʁ
::,s::ʃ
::,t::ƛ
::,u::ʊ
::,v::ʋ
::,w::ʷ
::,x::χ
::,y::ɥ
::,z::ʒ
::¡¡::ʼ
::¡a::ɒ
::¡e::ɜ
::¡g::ʢ
::¡o::ø
::¡q::ʡ
::¡s::ʂ
::¡z::ʐ
::ºa::æ
::ºe::ɛ
::ºf::ɸ
::ºg::ʕ
::ºh::ʰ
::ºi::ɨ
::ºj::ʝ
::ºl::ɮ
::ºo::œ
::ºº::ʷ
::ºq::ʔ
::ºr::ɾ
::ºs::ɕ
::ºu::ɤ
::ºv::ʌ
::ºz::ʑ

::çç::#

#Hotstring * C ? C1

; ::,G::Ğ
; ? = Activa en medio de palabras | C = Sensible a mayúsculas | * = No requiere espacio al final | B0 = No borra automáticamente (lo borramos nosotros)
; ::ch::{bs 2}ч

RAlt & e::SendText("ə")

