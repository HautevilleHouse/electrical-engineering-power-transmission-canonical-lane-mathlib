import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

structure PowerSystemStabilityPackage where
  swingEquation : Prop
  dampingFactor : Prop
  stabilityMargin : Prop
  criticalClearingTime : Prop

structure PowerSystemStabilityEvidence (S : PowerSystemStabilityPackage) where
  swingEquationClosed : S.swingEquation
  dampingFactorClosed : S.dampingFactor
  stabilityMarginClosed : S.stabilityMargin
  criticalClearingTimeClosed : S.criticalClearingTime

def PowerSystemStabilityClosed (S : PowerSystemStabilityPackage) : Prop :=
  S.swingEquation ∧ S.dampingFactor ∧ S.stabilityMargin ∧ S.criticalClearingTime

theorem power_system_stability_closed_from_evidence
    (S : PowerSystemStabilityPackage) (E : PowerSystemStabilityEvidence S) :
    PowerSystemStabilityClosed S := by
  exact And.intro E.swingEquationClosed
    (And.intro E.dampingFactorClosed
      (And.intro E.stabilityMarginClosed E.criticalClearingTimeClosed))

end ElectricalEngineeringPowerTransmissionCanonicalLaneLean
end HautevilleHouse