import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

structure TransmissionLinePackage where
  characteristicImpedance : Prop
  propagationConstant : Prop
  lineConfigurationValid : Prop
  surgeImpedanceLoading : Prop
  bandwidthConstraint : Prop

structure TransmissionLineEvidence (T : TransmissionLinePackage) where
  characteristicImpedanceClosed : T.characteristicImpedance
  propagationConstantClosed : T.propagationConstant
  lineConfigurationValidClosed : T.lineConfigurationValid
  surgeImpedanceLoadingClosed : T.surgeImpedanceLoading
  bandwidthConstraintClosed : T.bandwidthConstraint

def TransmissionLineClosed (T : TransmissionLinePackage) : Prop :=
  T.characteristicImpedance ∧ T.propagationConstant ∧
  T.lineConfigurationValid ∧ T.surgeImpedanceLoading ∧
  T.bandwidthConstraint

theorem transmission_line_closed_from_evidence (T : TransmissionLinePackage) (E : TransmissionLineEvidence T) :
    TransmissionLineClosed T := by
  exact And.intro E.characteristicImpedanceClosed
    (And.intro E.propagationConstantClosed
      (And.intro E.lineConfigurationValidClosed
        (And.intro E.surgeImpedanceLoadingClosed
          E.bandwidthConstraintClosed)))

end ElectricalEngineeringPowerTransmissionCanonicalLaneLean
end HautevilleHouse