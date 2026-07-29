import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

structure FaultAnalysisPackage where
  faultType : Type u
  preFaultNetwork : Prop
  faultImpedance : Prop
  postFaultCurrents : Prop

structure FaultAnalysisEvidence (F : FaultAnalysisPackage) where
  preFaultNetworkClosed : F.preFaultNetwork
  faultImpedanceClosed : F.faultImpedance
  postFaultCurrentsClosed : F.postFaultCurrents

def FaultAnalysisClosed (F : FaultAnalysisPackage) : Prop :=
  F.preFaultNetwork ∧ F.faultImpedance ∧ F.postFaultCurrents

theorem fault_analysis_closed_from_evidence (F : FaultAnalysisPackage)
    (E : FaultAnalysisEvidence F) : FaultAnalysisClosed F := by
  exact And.intro E.preFaultNetworkClosed
    (And.intro E.faultImpedanceClosed E.postFaultCurrentsClosed)

end ElectricalEngineeringPowerTransmissionCanonicalLaneLean
end HautevilleHouse