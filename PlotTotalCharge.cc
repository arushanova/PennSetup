////////////////////////////////////////////////////////////////////
/// \file PlotTotalCharge.cc
///
/// \brief Plot the total charge deposited in the 3 HQE PMTs in the SPECTRE setup
///
/// \author JR Wilson j.r.wilson@qmul.ac.uk>
///
////////////////////////////////////////////////////////////////////

#include <RAT/DU/DSReader.hh>
#include <RAT/DS/Entry.hh>
#include <RAT/DS/MC.hh>

#include <TH1D.h>
#include <TCanvas.h>
#include <TLegend.h>

#include <string>
using namespace std;

/// Plot the number of MC photoelectrons per event (or NumPE)
///
/// @param[in] fileName of the RAT::DS root file to analyse
/// @return the histogram plot
TH1D* PlotMCPETotNhit( const string& fileName )
{
  TH1D* hNumPE = new TH1D( "hNumPE", "Number of photoelectrons per event", 200, 0.0, 1000.0 );

  RAT::DU::DSReader dsReader( fileName );
  for( size_t iEntry = 0; iEntry < dsReader.GetEntryCount(); iEntry++ )
    {
      const RAT::DS::Entry& rDS = dsReader.GetEntry( iEntry );
      hNumPE->Fill( rDS.GetMC().GetMCPECount() );
    }
  hNumPE->GetYaxis()->SetTitle( "Count per 1 pe bin" );
  //  hNumPE->GetXaxis()->SetTitle( "Number of photoelectrons per event, all 4 PMTs" );
  //  hNumPE->GetXaxis()->SetTitle( "Number of photoelectrons per event, all 2 SNO PMTs" );
  hNumPE->GetXaxis()->SetTitle( "Number of photoelectrons per event, all PMTs" );
  hNumPE->Draw();
  return hNumPE;
}

/// Plot the number of MC photoelectrons per event (or NumPE) in just the 3 HQE PMTs, not including the trigger PMT
///
/// @param[in] fileName of the RAT::DS root file to analyse
/// @return the histogram plot
TH1D* PlotMCPEHQENhit( const string& fileName )
{
    TH1D* hNumPEHQE = new TH1D( "hNumPE", "Number of photoelectrons in HQE tubes per event", 200, 0.0, 1000.0 );
    
    RAT::DU::DSReader dsReader( fileName ); 
    int evcount = 0;
    for( size_t iEntry = 0; iEntry < dsReader.GetEntryCount(); iEntry++ )
    {
        const RAT::DS::Entry& rDS = dsReader.GetEntry( iEntry );
        const RAT::DS::MC& mc = rDS.GetMC();
        float sumCharge = 0;
        for( size_t iPMT = 0; iPMT < mc.GetMCPMTCount(); iPMT++ ){
            const RAT::DS::MCPMT& mcPMT = mc.GetMCPMT( iPMT );
            if(mcPMT.GetID()>1){
                sumCharge += mcPMT.GetMCPECount();
            }
        }
        hNumPEHQE->Fill(sumCharge);
	if(sumCharge>0)evcount++;
    }
    std::cout << evcount << " events with charge > 0 in HQE tubes" << std::endl;
    hNumPEHQE->GetYaxis()->SetTitle( "Count per 1 pe bin" );
    hNumPEHQE->GetXaxis()->SetTitle( "Number of photoelectrons in HQE tubes per event" );
    hNumPEHQE->Draw();
    return hNumPEHQE;
}


/// Plot all charge numbers
///
/// @param[in] fileName of the RAT::DS root file to analyse
void PlotCharge( const string& fileName )
{
  TCanvas* c1 = new TCanvas();
  TH1D* numMCPE = PlotMCPETotNhit( fileName );
  TH1D* numMCHQEPE = PlotMCPEHQENhit( fileName );
 
  gPad->SetLogy();
  numMCPE->Draw();
  numMCHQEPE->SetLineColor(2);
  numMCHQEPE->Draw("SAME");

  TLegend* t1 = new TLegend( 0.7, 0.7, 0.9, 0.9 );
  t1->AddEntry( numMCPE, "Total PE", "l" );
  t1->AddEntry( numMCHQEPE, "Just HQE PE", "l" );
  t1->Draw();
  c1->Update();
}
