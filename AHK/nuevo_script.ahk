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

::aa::ɑ
::ae::æ
::.a::ɑː

::ee::ɛː
::.e::ə

::ff::ˁ

::gg::ɣ
::,g::ğ
::.g::ʕ
::/g::ʢ

::hh::ħ
::.h::ʰ

::ii::iː
::.i::ɪ

::jj::ʲ

::.l::ɬ

::oo::ɔ
::oe::œ

::qq::ʔ
::.q::ˀ

::.r::ɾ
::,r::ʁ

::ss::ʃ
::,s::ş

::.tt::ƛ

::uu::uː
::.u::ʊ

::ww::ʷ

::xx::χ

::yy::ɥ

::zz::ʒ

::,,::ʼ
::..::ː

#Hotstring * C ? C1

::.G::ˁ
::,G::Ğ
::,S::Ş
::AE::Æ

RAlt & e::SendText("ə")