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

#Hotstring * C ?

::ñ3::ɛ
::ñ-::ʢ
::ñ'::ʼ
::ñae::æ
::ñç::tʃ
::ñf::ˀ
::ñg::ʕ
::ñh::ʰ
::ñi-::ɨ
::ñj::ʲ
::ño-::ø
::ñoe::œ
::ñq::ʔ
::ñt::ƛ
::ñw::ʷ
::ñy::tɬ

::ñx::χʼ

::,,::ː
::,a::ɑ
::,c::tsʼ
::,ç::tʃʼ
::,e::ə
::,g::ɣ
::,h::ħ
::,i::ɪ
::,k::kʼ
::,l::ɬ
::,o::ɔ
::,p::pʼ
::,q::qʼ
::,r::ʁ
::,s::ʃ
::,t::tʼ
::,u::ʊ
::,x::χ
::,y::tɬʼ
::,z::ʒ
::,f::ˁ



#Hotstring * C ? C1

; ::,G::Ğ


RAlt & e::SendText("ə")

; åÅ øØ ðÐ þÞ