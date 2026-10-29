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
::,a::ɑ
::,b::ʢ
::,c::tsʼ
::,d::ʂ
::,e::ə
::,f::ɟ
::,g::ɣ
::,h::ħ
::,i::ɪ
::,j::ʲ
::,k::kʼ
::,l::ɬ
::,m::ʕ
::,ñ::ɲ
::,n::ʔ
::,o::ɔ
::,p::pʼ
::,q::qʼ
::,r::ʁ
::,s::ʃ
::,t::tʼ
::,u::ʊ
::,v::ʋ
::,w::ʷ
::,x::χ
::,y::ɥ
::,z::ʒ
::¡¡::ʼ
::¡1::Ş
::¡2::Ś
::¡5::Š
::¡6::Č
::¡7::Ć
::¡8::Ğ
::¡a::ɒ
::¡e::ɜ
::¡o::ø
::º1::ş
::º2::ś
::º5::š
::º6::č
::º7::ć
::º8::ğ
::ºa::æ
::ºb::ʡ
::ºc::ts
::ºd::ʐ
::ºe::ɛ
::ºg::ˁ
::ºh::ʰ
::ºi::ɨ
::ºj::ʝ
::ºl::tɬ
::ºn::ŋ
::ºo::œ
::ºq::ˀ
::ºr::ɾ
::ºs::ɕ
::ºt::ƛ
::ºu::ɤ
::ºv::ʌ
::ºz::ʑ


#Hotstring * C ? C1

; ::,G::Ğ

RAlt & e::SendText("ə")

