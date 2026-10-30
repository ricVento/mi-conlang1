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
::,¡::ˀ
::,a::ɑ
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
::,r::ʁ
::,s::ʃ
::,u::ʊ
::,v::ʋ
::,w::ʷ
::,x::χ
::,y::ɤ
::,z::ʒ
::¡¡::ʼ
::¡5::š
::¡a::ɒ
::¡c::č
::¡e::ɜ
::¡g::ʢ
::¡h::ɥ
::¡o::ø
::¡s::ʂ
::¡z::ʐ
::º¡::ˁ
::º1::ş
::º3::ʔ
::º5::ś
::º8::ğ
::º9::ʡ
::ºa::æ
::ºc::ć
::ºe::ɛ
::ºf::ɸ
::ºg::ʕ
::ºh::ʰ
::ºi::ɨ
::ºj::ʝ
::ºl::ƛ
::ºo::œ
::ºr::ɾ
::ºs::ɕ
::ºv::ʌ
::ºz::ʑ

#Hotstring * C ? C1

; ::,G::Ğ

RAlt & e::SendText("ə")

