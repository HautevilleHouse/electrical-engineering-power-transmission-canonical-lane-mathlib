import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

structure StabilityPackage where
  transientStabilityMargin : Prop
  voltageStabilityIndex : Prop
  rotorSwingEquationSolved : Prop
  loadDynamicsIncluded : Prop
  contingencySetCovered : Prop

structure StabilityEvidence (S : StabilityPackage) where
  transientStabilityMarginClosed : S.transientStabilityMargin
  voltageStabilityIndexClosed : S.voltageStabilityIndex
  rotorSwingEquationSolvedClosed : S.rotorSwingEquationSolved
  loadDynamicsIncludedClosed : S.loadDynamicsIncluded
  contingencySetCoveredClosed : S.contingencySetCovered

def StabilityClosed (S : StabilityPackage) : Prop :=
  S.transientStabilityMargin ∧ S.voltageStabilityIndex ∧
  S.rotorSwingEquationSolved ∧ S.loadDynamicsIncluded ∧
  S.contingencySetCovered

theorem stability_closed_from_evidence (S : StabilityPackage) (E : StabilityEvidence S) :
    StabilityClosed S := by
  exact And.intro E.transientStabilityMarginClosed
    (And.intro E.voltageStabilityIndexClosed
      (And.intro E.rotorSwingEquationSolvedClosed
        (And.intro E.loadDynamicsIncludedClosed
          E.contingencySetCoveredClosed)))

end ElectricalEngineeringPowerTransmissionCanonicalLaneLean
end HautevilleHouse