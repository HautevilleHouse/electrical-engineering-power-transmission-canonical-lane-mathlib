import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

structure TransmissionLineModelingPackage where
  lineParameters : Prop
  surgeImpedance : Prop
  propagationConstant : Prop
  voltageProfile : Prop

structure TransmissionLineModelingEvidence (T : TransmissionLineModelingPackage) where
  lineParametersClosed : T.lineParameters
  surgeImpedanceClosed : T.surgeImpedance
  propagationConstantClosed : T.propagationConstant
  voltageProfileClosed : T.voltageProfile

def TransmissionLineModelingClosed (T : TransmissionLineModelingPackage) : Prop :=
  T.lineParameters ∧ T.surgeImpedance ∧ T.propagationConstant ∧ T.voltageProfile

theorem transmission_line_modeling_closed_from_evidence
    (T : TransmissionLineModelingPackage) (E : TransmissionLineModelingEvidence T) :
    TransmissionLineModelingClosed T := by
  exact And.intro E.lineParametersClosed
    (And.intro E.surgeImpedanceClosed
      (And.intro E.propagationConstantClosed E.voltageProfileClosed))

end ElectricalEngineeringPowerTransmissionCanonicalLaneLean
end HautevilleHouse