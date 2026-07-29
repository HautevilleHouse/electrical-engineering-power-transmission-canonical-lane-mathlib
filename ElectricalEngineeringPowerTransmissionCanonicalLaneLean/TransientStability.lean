import HautevilleHouse.ElectricalEngineeringPowerTransmissionCanonicalLaneLean.PowerFlowEquations

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

structure TransientStabilityPackage {G : TransmissionLineModelPackage}
    {F : PowerFlowEquationsPackage G} where
  swingEquation : Prop
  criticalClearingTime : Prop
  energyFunctionMethod : Prop
  stabilityMargin : Prop

structure TransientStabilityEvidence {G : TransmissionLineModelPackage}
    {F : PowerFlowEquationsPackage G} (S : TransientStabilityPackage F) where
  swingEquationClosed : S.swingEquation
  criticalClearingTimeClosed : S.criticalClearingTime
  energyFunctionMethodClosed : S.energyFunctionMethod
  stabilityMarginClosed : S.stabilityMargin

def TransientStabilityClosed {G : TransmissionLineModelPackage}
    {F : PowerFlowEquationsPackage G} (S : TransientStabilityPackage F) : Prop :=
  S.swingEquation ∧ S.criticalClearingTime ∧ S.energyFunctionMethod ∧ S.stabilityMargin

theorem transient_stability_closed_from_evidence
    {G : TransmissionLineModelPackage} {F : PowerFlowEquationsPackage G}
    (S : TransientStabilityPackage F) (E : TransientStabilityEvidence S) :
    TransientStabilityClosed S := by
  exact And.intro E.swingEquationClosed
    (And.intro E.criticalClearingTimeClosed
      (And.intro E.energyFunctionMethodClosed E.stabilityMarginClosed))

end ElectricalEngineeringPowerTransmissionCanonicalLaneLean
end HautevilleHouse
