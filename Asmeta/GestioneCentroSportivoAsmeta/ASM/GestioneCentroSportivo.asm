//Nome asm
asm GestioneCentroSportivo

//Importazione delle librerie necessarie (librerie standard ASMETA + logiche CTL e LTL per model checking)
import ../STDL/StandardLibrary
import ../STDL/CTLLibrary
import ../STDL/LTLLibrary

signature:

// ===============================
// DEFINIZIONE DEI DOMINI
// ===============================
enum domain Campo = {TENNIS1 | TENNIS2 | PADEL1 | PADEL2 | CALCIO} //Dominio dei possibili campi da gioco
abstract domain Utente //Dominio astratto che fa riferimento all'utente che prenota il campo
abstract domain Giorno //Dominio astratto che fa riferimento al giorno della prenotazione del campo
enum domain Fascia = {FASCIA1 | FASCIA2 | FASCIA3 | FASCIA4 | FASCIA5 | FASCIA6 | FASCIA7 | FASCIA8 | FASCIA9 | FASCIA10 | FASCIA11 | FASCIA12 | FASCIA13 | FASCIA14} //Dominio che rappresenta le 14 fasce orarie possibili per poter prenotare un campo
enum domain StatoCampo = {LIBERO | PRENOTATO | MANUTENZIONE} //Dominio che specifica lo stato del campo
enum domain StatoUtente = {ATTIVO | BLOCCATO} //Dominio che specifica lo stato dell'utente

// ===============================
// FUNZIONI MONITORATE (input esterni)
// ===============================
monitored richiestaCampo : Utente -> Campo //Funzione che specifica il campo che richiede un utente
monitored richiestaGiorno : Utente -> Giorno //Funzione che specifica il giorno in cui vuole prenotare l'utente
monitored richiestaFascia : Utente -> Fascia //Funzione che specifica la fascia oraria in cui l'utente vuole prenotarsi
monitored richiestaCancellazione : Utente -> Boolean //Funzione che specifica la volontà dell'utente di cancellare la prenotazione

// ===============================
// FUNZIONI CONTROLLATE (stato modificabile)
// ===============================

controlled prenotazioni : Prod(Campo, Giorno, Fascia) -> Utente //Mappa ogni combinazione Campo-Giorno-Fascia all'utente che ha effettuato la prenotazione
controlled statoCampo : Prod(Campo, Giorno, Fascia) -> StatoCampo //Mappa ogni combinazione Campo-Giorno-Fascia al suo stato (utile per gestire manutenzione)
controlled statoUtente : Utente -> StatoUtente //Stato dell’utente (ATTIVO o BLOCCATO)
controlled noShow : Utente -> Integer //Numero di volte in cui l’utente non si è presentato a una prenotazione

// ===============================
// FUNZIONI STATICHE (valori fissi)
// ===============================

static maxPrenotazioniGiornaliere : Integer //Numero massimo di prenotazioni giornaliere per utente (es. 2)

// ===============================
// FUNZIONI DERIVATE
// ===============================

derived utentePrenotazioniGiornaliere : Prod(Utente,Giorno) -> Integer // Funzione derivata che calcola il numero di prenotazioni effettuate da un utente in un dato giorno



