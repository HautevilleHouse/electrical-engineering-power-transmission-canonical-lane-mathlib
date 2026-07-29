import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

structure HVDCTransmission where
  converterStationA : Type u
  converterStationB : Type v
  dcVoltage : ℝ
  dcCurrent : ℝ
  powerTransfer : ℝ
  modulationControl : Prop
  commutationSuccess : Prop
  dcFaultHandling : Prop
  acSideFilter : Prop
  activePowerControl : Prop
  reactivePowerControl : Prop

structure HVDCEvidence (H : HVDCTransmission) where
  modulationControlClosed : H.modulationControl
  commutationSuccessClosed : H.commutationSuccess
  dcFaultHandlingClosed : H.dcFaultHandling
  acSideFilterClosed : H.acSideFilter
  activePowerControlClosed : H.activePowerControl
  reactivePowerControlClosed : H.reactivePowerControl

def HVDCClosed (H : HVDCTransmission) : Prop :=
  H.modulationControl ∧ H.commutationSuccess ∧ H.dcFaultHandling ∧ H.acSideFilter ∧ H.activePowerControl ∧ H.reactivePowerControl

theorem hvdc_closed_from_evidence (H : HVDCTransmission) (E : HVDCEvidence H) :
    HVDCClosed H := by
  exact And.intro E.modulationControlClosed (And.intro E.commutationSuccessClosed (And.intro E.dcFaultHandlingClosed (And.intro E.acSideFilterClosed (And.intro E.activePowerControlClosed E.reactivePowerControlClosed))))

end ElectricalEngineeringPowerTransmissionCanonicalLaneLean
end HautevilleHouse